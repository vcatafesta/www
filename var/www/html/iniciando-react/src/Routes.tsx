import {
    BrowserRouter as Router,
    Routes,
    Route
} from "react-router-dom"
import { Catalog } from "./Pages/Catalog"
import { Cart } from "./Pages/Cart"

export function AppRoutes() {
    return (
        <Router>
            <Route path="/catalog">
                <Catalog />
            </Route>
            <Route path="/cart">
                <Cart />
            </Route>
        </Router>
    )

}