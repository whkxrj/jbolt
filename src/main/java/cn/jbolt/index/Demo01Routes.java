package cn.jbolt.index;

import cn.jbolt._admin.demo.AutoSelectDemoController;
import com.jfinal.config.Routes;

public class Demo01Routes extends Routes {

    @Override
    public void config() {
        this.setBaseViewPath("/_view/_admin/demo01/AutoSelect");
        this.add("/demo/autoselect1", AutoSelectDemoController.class,"/");
    }
}
